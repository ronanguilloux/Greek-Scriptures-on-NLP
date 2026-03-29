.PHONY: install

install:
	rm -rf .venv
	python3.12 -m venv .venv
	.venv/bin/pip install -U pip setuptools wheel -r requirements.txt
	curl -L -o grc_odycy_joint_trf-0.7.0-py3-none-any.whl "https://huggingface.co/chcaa/grc_odycy_joint_trf/resolve/main/grc_odycy_joint_trf-0.7.0-py3-none-any.whl"
	.venv/bin/pip install ./grc_odycy_joint_trf-0.7.0-py3-none-any.whl
	rm grc_odycy_joint_trf-0.7.0-py3-none-any.whl
