* **[Project State](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md): Maintained**
* **Issues [Response Time Maximum](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md): 7 days or more**
* **Pull Request [Response Time Maximum](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md): 7 days or more**

# Digitalocean transport plugin for Train

This plugin allows applications that rely on Train to communicate with the Digitalocean API.  For example, InSpec uses this to perform compliance checks against Digitalocean infrastructure. Train plugins are managed by InSpec CLI.

## Usage

When used in combination with the [InSpec Digitalocean resource pack](https://github.com/chris-rock/inspec-digitalocean) you can e.g. verify droplets:

```ruby
describe digitalocean_droplet(id: '123456') do
  it { should exist }
  its('name') { should eq 'nginx-web-ams3' }
  its('image') { should eq 'ubuntu-16-04-x64' }
  its('region') { should eq 'ams3' }
  its('size') { should eq 's-1vcpu-1gb' }
end
```

## Preconditions

- InSpec 3 or later.
- [Digitalocean API key](https://cloud.digitalocean.com/account/api/tokens)


## Installation

Train plugins are distributed as gems.  You may choose to manage the gem yourself, but if you are an InSpec user, InSPec can handle it for you.

Simply run:

```
$ inspec plugin install train-digitalocean
```

In order to use this example, you need to create a [DigitalOcean API Token](https://cloud.digitalocean.com/account/api/tokens) and export it as an environment variable.

```bash
export DIGITALOCEAN_TOKEN="Put Your Token Here"
```

Verify the plugin and the connection to Digitalocean

```
$ inspec detect -t digitalocean://

== Platform Details

Name:      digitalocean
Families:  cloud, api
Release:   0.1.0
```

## Authenticating to Digitalocean

You need to set the `DIGITALOCEAN_TOKEN` environment variable with your credentials.

## Reporting Issues

Bugs, typos, limitations, and frustrations are welcome to be reported through the [GitHub issues page for the train-digitalocean project](https://github.com/chris-rock/train-digitalocean/issues).

You may also ask questions in the #inspec channel of the CHef Community Slack team.  However, for an issue to get traction, please report it as a github issue.

### Development Process

If you wish to contribute to this plugin, please use the usual fork-branch-push-PR cycle.  All functional changes need new tests, and bugfixes are expected to include a new test that demonstrates the bug.

### Reference Information

[Plugin Development](https://github.com/inspec/train/blob/master/docs/dev/plugins.md) is documented on the `train` project on GitHub.
