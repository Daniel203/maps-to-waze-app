run-dev:
	sudo adb start-server
	docker compose run --rm flutter-dev flutter run --dart-define-from-file=env.dev.json

run-prod:
	docker compose run --rm flutter-dev flutter run --dart-define-from-file=env.prod.json

build-apk:
	docker compose run --rm flutter-dev flutter build apk --dart-define-from-file=env.prod.json

build-apk-dev:
	docker compose run --rm flutter-dev flutter build apk --dart-define-from-file=env.dev.json
