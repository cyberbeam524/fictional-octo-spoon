# fictional-octo-spoon

With few annotators or domain experts we need to be selective on which data out of possibly thousands or millions of unlabelled data to choose from for labelling. Labelling is necessary for two reasons:
- Need for training data to improve models: Models may predict new data wrongly due to seeing unseen features it has not been trained on. Thus, Ground truth may differ from current model predictions.
- Need for accurate evaluation metrics: Unlabelled data cannot be used for evaluating the model on new data that may have vastly different attributes compared to old data that the model was evaluated on

### Dependencies
- Docker
- MLFlow (Tracking model metrics and experiments)
- DagsHub (for model registry and data versioning)
- Label Studio (for annotators to use as user interface for annotating images)

Run this to start the label encoding features:

```
make dockercomposeup
```


![alt text](https://github.com/cyberbeam524/fictional-octo-spoon/blob/main/imgs/ArchitectureDiagram.png)


Design Considerations:
- Data drifts are detected early in the system with ranking algorithm to find top N unlabelled data that the model has least confidence in. Common metrics used to prioritise data for labelling:
    - Pooling 
    - Least confidence (Most effective for asking humans for help)
    - Random sampling (least effective)
- Unseen data and new trends in new data that the current model has not seen/trained on
- Decoupled design so that each service can be independently scaled up according to users and annotators' traffic
- Models are regularly trained and the latest models are always used for prediction, ensuring up to date models that are constantly evolving


Future improvements:
- Use other metrics for prioritising data for labelling and compare results
- Use metrics from MLFlow to trigger training only when accuracy falls under a certain percentage instead triggering training when there are 50 new annotations fetched from humans

Credits: 
- https://bytebytego.com/intro/machine-learning-system-design-interview
- https://dagshub.com/docs/tutorial/label_studio_tutorial/