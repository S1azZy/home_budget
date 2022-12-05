prod:
	bundle exec rails assets:precompile
	bundle exec rails server -p 3000 -e production

dev:
	bin/dev
