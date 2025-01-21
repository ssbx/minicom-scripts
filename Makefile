
BACKUP_DIR = 
BACKUP_DIR_GEN = $(shell mktemp -d)
BACKUP_DIR_SET = $(eval BACKUP_DIR=$(BACKUP_DIR_GEN))

MINICOM_DIR = $(HOME)/Minicom

.PHONY: default
default: checkdeps
	@echo "run \"make install\" to setup"
	@echo "A target will create a backup dir and save overwriten files"


.PHONY: checkdeps
checkdeps:
	@which expect  > /dev/null || echo "ERR: missing expect (run: apt install expect)"
	@which minicom > /dev/null || echo "ERR: missing minicom (run: apt install minicom)"


.PHONY: backup
backup:
	$(BACKUP_DIR_SET)
	if [ -e $(MINICOM_DIR) ]; then mv $(MINICOM_DIR) $(BACKUP_DIR)/; fi
	if [ -e $(HOME)/.minirc ]; then mv $(HOME)/.minirc* $(BACKUP_DIR)/; fi
	@echo "INFO: BACKUP_DIR is located at $(BACKUP_DIR)"
	ls -a $(BACKUP_DIR)

.PHONY: install
install: checkdeps backup
	mkdir -p $(MINICOM_DIR)/Down
	mkdir -p $(MINICOM_DIR)/Up
	mkdir -p $(MINICOM_DIR)/Logs
	install -m 700 -d $(MINICOM_DIR)/Scripts
	install -v -m 600 Scripts/* $(MINICOM_DIR)/Scripts/
	cd minirc && for i in minirc*; do install -v -m 644 $$i $(HOME)/.$$i; done
