//
//  LZQuartzPDFView.m
//  Quartz2D
//
//  Created by lucas on 16/8/26.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzPDFView.h"

@implementation LZQuartzPDFView {
    CGPDFDocumentRef _pdfDocument;
}

- (void)drawInContext:(CGContextRef)context {
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);

    CGPDFPageRef page = CGPDFDocumentGetPage(self.pdfDocument, 1);
    
    CGContextSaveGState(context);

    CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(page, kCGPDFArtBox, self.bounds, 0, true);

    CGContextConcatCTM(context, pdfTransform);

    CGContextDrawPDFPage(context, page);
    
    CGContextRestoreGState(context);
}

- (CGPDFDocumentRef)pdfDocument {
    if (_pdfDocument == NULL) {
        CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("quartz.pdf"), NULL, NULL);
        _pdfDocument = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
        CFRelease(pdfURL);
    }
    return _pdfDocument;
}

- (void)dealloc {
    CGPDFDocumentRelease(_pdfDocument);
}

@end
