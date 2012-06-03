confliction
===========

A YAML config loader with checking conflict from a example.

## Features

  * You can load a config .yml file and get a hash from YAML.
  * Notify the conflict between .yml and .yml.(example|sample)

## Usage

    # config.yml(not committed)
    name: "taro"

    # config.yml.sample(committed)
    name: "sample name"

You can load config.yml. 

    require "confliction"
    p Confliction.load_yml("config.yml")
    # => {name: "taro"}

Then, other developer updates config.yml.sample.

    # config.yml.sample(committed)
    fullname: "sample fullname"
    age: 20

Confliction raises a confiction error when you load it.

    require "confliction"
    p Confliction.load_yml("config.yml")
    # => RuntimeError:
    # You must specify follow keys in config file (config.yml)
    # - fullname
    # - age
    # 
    # You must not specify follow keys in config file (config.yml):
    # + name
