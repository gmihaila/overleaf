# Global variables

.PHONY: server
server: ## Build server from scratch.
	@docker build . -t my-sharelatex -f sharelatex/Dockerfile

.PHONY: push
push: ## Rebuild docs automatically and push to github.
	git add --all
	git commit -m "Updates for pwn needs."
	git push origin master
	@echo "Repo updated!"

#.PHONY: style
#style: ## Format source code automatically and check is there are any problems left that need manual fixing.
#	black $(CHECK_DIRS)
#	isort $(CHECK_DIRS)
#
#.PHONY: quality
#quality: ## Runs checks on all files.
#	@echo "Make sure to run 'style' before to fix any code indentation issues!"
#	black --check $(CHECK_DIRS)
#	isort --check-only $(CHECK_DIRS)
#	pylint $(CHECK_DIRS)
#
#.PHONY: clean
#clean: ## Remove build artifacts.
#	@echo "+ $@"
#	@rm -fr save_dir/
#	@rm -fr dist/
#	@rm -fr *.egg-info
#	@rm -fr wandb
#	@rm -fr artifacts
#	@rm -fr save_dir
#	@rm -fr .ipynb_checkpoints
#	@rm -fr  ~/.cache/huggingface/datasets
#	@rm -fr  ~/.cache/huggingface/hub
#
#.PHONY: doccano
#doccano: ## Build Doccano annotation server.
#	@docker compose --file docker-compose.yml --project-name $(PROJECT_NAME) up --detach
#
#.PHONY: del-doccano
#del-doccano: ## Stops Doccano containers and removes them.
#	@docker compose down
#
#.PHONY: data
#data: ## Make Data.
#	@echo "Cleaning old data.."
#	@rm -rf annotations/sst2/doccano/annotated annotations/sst2/doccano/from_annotate
#	@echo "now pulling data from Docanno..."
#	@python data_from_annotate_pull_from_client.py
#	@echo "Done! Now formatting into model data..."
#	@python data_from_annotate_format_for_export.py
#	@echo "Data is ready! You can push now and start training!"
#
#.PHONY: exp
#exp: ## Run experiments.
#	@bash scripts/run_experiments.sh
#
#.PHONY: re
#re: ## Run evaluations.
#	@bash scripts/run_evaluations.sh
#
#.PHONY: pm
#pm: ## Publish models.
#	@rm -fr  ~/.cache/huggingface/hub
#	@bash scripts/run_publish_models.sh
#
#.PHONY: pd
#pd: ## Prepare data.
#	@bash scripts/run_prepare_data.sh
#
#.PHONY: jl
#jl: ## Start Jupyter Lab server.
#	@venv/bin/jupyter-lab

.PHONY: help
help: ## Display make help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'