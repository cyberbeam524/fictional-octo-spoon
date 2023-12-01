startlabelencoder:
	docker run -it -p 8080:8080 \
    -v $(pwd)/mydata:/label-studio/data \
    --env LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED=true \
    --env LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT=/label-studio/data/images \
    heartexlabs/label-studio:latest

buildImage:
	cd segment_anything_model \
	docker build . -t sam:latest

dockercomposeup:
	cd segment_anything_model \
	docker compose up --build

