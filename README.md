# SPEEDRUN THE FINALEXAM (S2, Linux)

> **Warning**
> You are prohibited to use scripts here to cheat in the final exam.
> Scripts here are for Pan to speedrun the final exam.

This repository contains some prebuilt images that have bundled
some images and scripts that I can use to speedrun the final exam.

## Documentation

# Preparation: SSH keys and AZ CLI

- AZ CLI: https://learn.microsoft.com/zh-tw/cli/azure/install-azure-cli-windows?tabs=azure-cli
- Windows Terminal: https://github.com/microsoft/terminal/releases/tag/v1.17.11461.0
- VS Code: https://code.visualstudio.com/download

```bash
ssh-keygen
```

# Create VM by the AZ CLI

### List all locations

```bash
az account list-locations --query "[*].name"
```

### List all images

```bash
az vm image list --query "[*].urn"
```

### Create a resource group

```bash
az group create -n nkust-20230621 -l southeastasia
```

### Create a VM

```bash
az vm create -g nkust-20230621 -n ubuntu \
	--image "Canonical:0001-com-ubuntu-server-jammy:22_04-lts-gen2:latest" \
	--data-disk-sizes-gb "60" \
	--zone 1 --public-ip-sku Standard --security-type TrustedLaunch \
	--enable-secure-boot true --enable-vtpm true \
	--verbose;

export ip=""  # write your IP here

# -- in your local machine --
echo "$ip nkust.azure.internal" >> /etc/hosts
```

### Extra

- `--count %d` The VM count to create.
- `--priority Spot` Spot mode

### Expose 80 Port

```bash
az network nsg rule create -g "nkust-20230621" --name "http-access" --nsg-name "ubuntuNSG" --destination-port-ranges "80" --priority 256;
```

## License

Apache-2.0
