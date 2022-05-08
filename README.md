# RSA-for-Object-Scene-Perception
For a dataset of images, I used transfer learning to test the performance of several neural networks and applied representational similarity analysis (RSA).

- 'Python_extractFeatures' folder is to extract features of a given image from a selected neural network trained on the object (ImageNet) or scene classification (Places365) or semantic segmentation (COCOpascal).
- 'MATLAB_extractRDMs' folder is to extract representational dissimilarity matrices (RDMs) for RSA.
  - Inside '/figures' folder you can find the results. According to the partial correlation, the models do not explain the observed patterns in the feature space. I probably need to collect a better set of images to control the 'object', 'scene', and 'both' conditions.
