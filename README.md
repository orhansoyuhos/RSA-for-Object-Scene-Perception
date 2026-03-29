# RSA-for-Object-Scene-Perception

The primary goal of this project was to determine whether images containing both objects and scenes align more closely with the object or scene category. To address this question, I employed various neural networks, such as ResNet and AlexNet, pre-trained on object classification (ImageNet) or scene classification (Places365) tasks. I then fine-tuned these networks using a custom dataset of object and scene images to adapt their feature extraction capabilities.

For evaluation, I utilized a separate testing dataset containing images of objects, scenes, and a combined "both" condition. I extracted features from each layer of the neural networks and assessed which model (control, scene, or object) could best explain the variance in the feature space across the different layers using representational similarity analysis (RSA). This involved computing representational dissimilarity matrices (RDMs) for each network layer. For instance, the RSA results indicated that in the final layers of an ImageNet-trained AlexNet, images containing both objects and scenes were more similar to scenes than to objects.

However, the overall results were not statistically significant, indicating that the models were unable to effectively explain the variance in the feature space. This suggests that a more robust stimulus set or a different approach may be needed to improve the prediction accuracy for the "both" condition.

## Code

The project includes two main components: the 'Python_extractFeatures' folder for feature extraction from the neural networks, and the 'MATLAB_extractRDMs' folder for calculating RDMs for RSA, with the results available in the '/figures' folder.

## Example image set

![obj_scene_ copy](https://user-images.githubusercontent.com/44211738/227697445-05e02f62-4e04-4dc8-97bb-09c6b473db77.png)

## Example feature extraction (Alexnet trained on Imagenet)

- RDMs for models and features:
![example](https://user-images.githubusercontent.com/44211738/167296896-ce5ec294-7b7d-4586-9837-251480525473.png)

- RSA results: 
![example_Alexnet(Imagenet)](https://user-images.githubusercontent.com/44211738/167297020-40a7301f-9bf6-4d9a-b97c-fc9ca1c30744.png)

## Acknowledgement
- This project was part of my research internship in the Object Vision Group at CIMeC. I would like to thank and acknowledge Dr. Stefania Bracci’s supervision during my training.
