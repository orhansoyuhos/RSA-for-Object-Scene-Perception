# RSA-for-Object-Scene-Perception

The primary goal of this project was to determine whether images containing both objects and scenes align more closely with the object or scene category. To address this question, I employed various neural networks — AlexNet, ResNet-50, and FCN-ResNet-50 — pre-trained on object classification (ImageNet), scene classification (Places365), or semantic segmentation (COCOpascal) tasks. I then fine-tuned these networks using a custom dataset of object and scene images to adapt their feature extraction capabilities.

For evaluation, I utilized a separate testing dataset containing 192 images: 64 objects, 64 scenes, and 64 combined "both" condition images. I extracted features from each layer of the neural networks and assessed which theoretical model (Control, Object, or Scene) could best explain the variance in the feature space across different layers using representational similarity analysis (RSA). This involved computing representational dissimilarity matrices (RDMs) for each network layer and correlating them with three predefined theoretical models:

- **Control Model**: each image category (objects, both, scenes) is only similar to itself
- **Object Model**: objects and "both" images are similar to each other, and distinct from scenes
- **Scene Model**: scenes and "both" images are similar to each other, and distinct from objects

For instance, the RSA results indicated that in the final layers of an ImageNet-trained AlexNet, images containing both objects and scenes were more similar to scenes than to objects.

However, the overall results were not statistically significant, indicating that the models were unable to effectively explain the variance in the feature space. This suggests that a more robust stimulus set or a different approach may be needed to improve the prediction accuracy for the "both" condition.

## Code

The project includes two main components: the `Python_extractFeatures` folder for feature extraction from the neural networks, and the `MATLAB_extractRDMs` folder for calculating RDMs for RSA, with the results available in the `/figures` folder.

### Dependencies
- **Python**: PyTorch (feature extraction)
- **MATLAB**: [CoSMoMVPA](https://www.cosmomvpa.org/) (RDM computation)

## Networks and Training Datasets

| Network | Training Dataset | Task |
|---|---|---|
| AlexNet | ImageNet | Object classification |
| AlexNet | Places365 | Scene classification |
| ResNet-50 | ImageNet | Object classification |
| ResNet-50 | Places365 | Scene classification |
| FCN-ResNet-50 | COCOpascal | Semantic segmentation |

## Example image set

![obj_scene_ copy](https://user-images.githubusercontent.com/44211738/227697445-05e02f62-4e04-4dc8-97bb-09c6b473db77.png)

## Example feature extraction (Alexnet trained on Imagenet)

- RDMs for models and features:
![example](https://user-images.githubusercontent.com/44211738/167296896-ce5ec294-7b7d-4586-9837-251480525473.png)

- RSA results: 
![example_Alexnet(Imagenet)](https://user-images.githubusercontent.com/44211738/167297020-40a7301f-9bf6-4d9a-b97c-fc9ca1c30744.png)

## Acknowledgement
- This project was part of my research internship in the Object Vision Group at CIMeC. I would like to thank Dr. Stefania Bracci for her supervision during my training.
