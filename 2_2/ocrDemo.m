function ocrDemo(img)
% OCR Demostration.

textObj = ocr(img, 'language', 'English');

highConfIndex = textObj.WordConfidences > 0.2;
highConfBBoxes = textObj.WordBoundingBoxes(highConfIndex, :);
highConfWords = textObj.Words(highConfIndex);
Ihighconf = insertObjectAnnotation(img, 'rectangle', highConfBBoxes, highConfWords);
figure;
imshow(Ihighconf, 'InitialMagnification', 'Fit');