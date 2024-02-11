COMPOSE_CONFIG=AMP.yaml
COMPOSE=docker-compose -f $(COMPOSE_CONFIG)
DEFAULT_DB=tng_db6

build:
	$(COMPOSE) build

start:
	@mkdir -p db/data
	$(COMPOSE) up --remove-orphans --detach

stop:
	$(COMPOSE) stop

tail:
	$(COMPOSE) logs -n10 -f

top:
	$(COMPOSE) top

ps:
	$(COMPOSE) ps

mysql:
	$(COMPOSE) exec -ti db mysql -uroot -proot $(DEFAULT_DB)

backup:
	@mkdir -p db/backups
	$(COMPOSE) exec -ti db mysqldump -uroot -proot --opt $(DEFAULT_DB) > db/backups/tng_db6.$(shell date +%s).sql
