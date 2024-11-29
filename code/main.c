#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char uint8;
typedef unsigned int uint;

typedef struct {
  uint w, h;
  uint8 *data;
} Image;

uint newImage(Image *pImg, uint w, uint h)
{
  uint size = w * h * 3;
  if (!pImg) return 0;
  assert(!pImg->data);
  pImg->data = malloc(size);
  pImg->w = pImg->data ? w : 0; pImg->h = pImg->data ? h : 0;
  if (!pImg->data) {
    fprintf(stderr,
      "Allocation of %u bytes for image data failed!\n", size);
    return 0;
  }
  return size;
}

void freeImage(Image *pImg)
{
  if (!pImg) return;
  free(pImg->data);
  pImg->data = 0;
}

int readTxt(FILE *f, Image *pImg)
{
  char buffer[256] = ""; uint w = 0, h = 0;
  if (!f || !pImg) return 0;
  assert(!pImg->data);

  // Read dimensions from the first line
  if (!fgets(buffer, sizeof buffer, f)) return 0;
  if (sscanf(buffer, "%u %u", &w, &h) != 2) {
    fprintf(stderr, "Invalid format for dimensions in input file.\n");
    return -1;
  }

  if (!(newImage(pImg, w, h))) return -1;

  // Read pixel values (assumes grayscale values in the format)
  uint size = pImg->w * pImg->h * 3;
  for (uint i = 0; i < pImg->h; ++i) {
    for (uint j = 0; j < pImg->w; ++j) {
      if (fscanf(f, "%hhu", &pImg->data[(i * pImg->w + j) * 3]) != 1) {
        fprintf(stderr, "Not enough pixel data in input file!\n");
        return -1;
      }
      // Grayscale values are used for all 3 channels (R, G, B)
      pImg->data[(i * pImg->w + j) * 3 + 1] = pImg->data[(i * pImg->w + j) * 3];
      pImg->data[(i * pImg->w + j) * 3 + 2] = pImg->data[(i * pImg->w + j) * 3];
    }
  }
  return 0;
}

void writeTxt(FILE *f, Image *pImg)
{
  if (!pImg || !pImg->data) return;
  fprintf(f, "%u %u\n", pImg->w, pImg->h);

  uint size = pImg->w * pImg->h * 3;
  for (uint i = 0; i < pImg->h; ++i) {
    for (uint j = 0; j < pImg->w; ++j) {
      fprintf(f, "%hhu ", pImg->data[(i * pImg->w + j) * 3]);
    }
    fprintf(f, "\n");
  }
}

#define GET_PIXEL(P_IMG, ROW, COL, C) \
  ((P_IMG)->data[((ROW) * (P_IMG)->w + (COL)) * 3 + (C)])

void convolute(
  Image *pImg, uint dim, int *mat,
  Image *pImgOut)
{
  if (!pImg || !pImg->data) return;
  assert(dim & 1); /* dim Mat must be odd */
  { int offs = -(dim / 2);
    unsigned i, j;
    for (i = 0; i < pImg->h; ++i) {
      for (j = 0; j < pImg->w; ++j) {
        unsigned iM, jM;
        uint8 *pixelOut = pImgOut->data + (i * pImg->w + j) * 3;
        int r = 0, g = 0, b = 0;
        for (iM = 0; iM < dim; ++iM) {
          for (jM = 0; jM < dim; ++jM) {
            int mIJ = mat[iM * dim + jM];
            r += mIJ
              * (int)GET_PIXEL(pImg,
                (pImg->h + i + offs + iM) % pImg->h,
                (pImg->w + j + offs + jM) % pImg->w,
                0);
            g += mIJ
              * (int)GET_PIXEL(pImg,
               (pImg->h + i + offs + iM) % pImg->h,
               (pImg->w + j + offs + jM) % pImg->w,
               1);
            b += mIJ
              * (int)GET_PIXEL(pImg,
               (pImg->h + i + offs + iM) % pImg->h,
               (pImg->w + j + offs + jM) % pImg->w,
               2);
          }
        }
#if 1 /* colored output */
        pixelOut[0] = (uint8)abs(r);
        pixelOut[1] = (uint8)abs(g);
        pixelOut[2] = (uint8)abs(b);
#else /* gray level output */
        pixelOut[0] = pixelOut[1] = pixelOut[2]
          = (abs(r) + abs(g) + abs(b)) / 3;
#endif /* 1 */
      }
    }
  }
}

int main(void)
{
  enum { Dim = 3 };

  int mat[Dim * Dim] = {
    -1, -1, -1,
    -1,  8, -1,
    -1, -1, -1
  };

  FILE *f = 0;
  const char *file = "values.txt";   // Input file
  const char *outFile = "output.txt"; // Output file
  
  // read TXT image
  if (!(f = fopen(file, "r"))) {
    fprintf(stderr, "Cannot open input file '%s'!\n", file);
    return -1;
  }

  Image img = { 0, 0, NULL };
  if (readTxt(f, &img)) return -1;
  fclose(f); f = 0;

  // make output image
  Image imgOut = { 0, 0, NULL };
  newImage(&imgOut, img.w, img.h);

  // convolute image
  convolute(&img, Dim, mat, &imgOut);

  // write TXT image
  if (!(f = fopen(outFile, "w"))) {
    fprintf(stderr, "Cannot create output file '%s'!\n", outFile);
    return -1;
  }
  writeTxt(f, &imgOut);
  fclose(f);
  
  return 0;
}
