<div align="center">
	<p>
	<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 /><br />
	<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/><br />
	<h2>1password-action</h2>
	<img alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/ThoughtWorks-DPS/1password-action/.github%2Fworkflows%2Fdevelopment-build.yaml"> <img alt="GitHub Release" src="https://img.shields.io/github/v/release/ThoughtWorks-DPS/1password-action"> <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
	</p>
</div>

Action for common 1password-cli uses.  

### tpl

Populate template file with values from 1password vault and write to out-file.

Must provide the template filename. By default, the command will look in the  
tpl/ folder and use the tpl-file without the tpl-ext as the out-file name. you  
may override all of these defaults.  

For example, if you provide a tpl-file parameter of "myfile.yaml" the command will  
attempt to read "./tpl/myfile.yaml.tpl" and then write the result to "./myfile.yaml"  

See template file format documentation at:  
https://developer.1password.com/docs/cli/secrets-template-syntax/  

Provides support for running custom bash scripts before an dafter template action.  

```yaml
- name: populate template with 1password-action/tpl using defaults
  uses: ThoughtWorks-DPS/1password-action/tpl@v0.1.0
  with:
    tpl-file: config.json
    out-path: ~./docker
```

### write-to-file

Writes op-value from 1password to out-file.
op-value format = vault/item/field.

```yaml
- name: write value using 1password-action/write-to-file
  uses: ThoughtWorks-DPS/1password-action/write-to-file@v0.1.0
  with:
    op-value: my-vault/gmail/address
    out-file: email.txt
```
