BASE_HREF = '/'
GITHUB_REPO := https://github.com/vchib1/vchib1.github.io.git

clean:
	@echo "Cleaning up..."
	flutter clean
	@echo "Getting Packages..."
	flutter pub get
	@echo "Success..."

build:
	@echo "Cleaning up..."
	flutter clean
	@echo "Getting Packages..."
	flutter pub get
	@echo "Building Web..."
	flutter build web --wasm

deploy:
	make clean
	@echo "Building Web..."
	flutter build web --base-href $(BASE_HREF) --release
	@echo "Deploying Web to Repository..."
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "$(msg)" && \
	git branch -m main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -f origin main

	cd ../..
	@echo "Deployment Success :)"

host:
	make clean
	flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0 --profile
	@echo "Web server running on http://localhost:8080"


.phony: host clean deploy