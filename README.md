# RSA-for-Object-Scene-Perception

In this project, I aimed to analyze the feature extraction capabilities of various neural networks trained on object classification (ImageNet), scene classification (Places365), and semantic segmentation (COCOpascal) tasks. I used a dataset containing object and scene images and applied transfer learning to test the feature extraction performance of these networks.

To evaluate the results, I employed representational similarity analysis (RSA) by extracting representational dissimilarity matrices (RDMs) for each network. The analysis revealed that the models did not adequately explain the observed patterns in the feature space. This suggests that a better set of images might be needed to control the 'object', 'scene', and 'both' conditions effectively.

## Code

The project includes two main components: the 'Python_extractFeatures' folder for feature extraction from the neural networks, and the 'MATLAB_extractRDMs' folder for extracting RDMs for RSA, with the results available in the '/figures' folder.

## Example image set

![obj_scene_ copy](https://user-images.githubusercontent.com/44211738/227697445-05e02f62-4e04-4dc8-97bb-09c6b473db77.png)

## Example feature extraction (Alexnet trained on Imagenet)

- RDMs for models and features:
![example](https://user-images.githubusercontent.com/44211738/167296896-ce5ec294-7b7d-4586-9837-251480525473.png)

- RSA results: 
![example_Alexnet(Imagenet)](https://user-images.githubusercontent.com/44211738/167297020-40a7301f-9bf6-4d9a-b97c-fc9ca1c30744.png)

## Acknowledgement
- This project was part of my research internship in Object Vision Group at CIMeC. I would like to thank and acknowlege Dr. Stefania Bracci's supervison during my training.
