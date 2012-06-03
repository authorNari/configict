require "erb"
require "yaml"

module Configict
  class LoadError < StandardError; end
  def self.load_yml(path)
    config = YAML.load(ERB.new(File.read(path)).result)
    example_config = example_config(path)
    if example_config
      diff = diff_keys(config, example_config)
      if !diff["-"].empty? || !diff["+"].empty?
        res = ["You must specify follow keys in config file (#{path}):"]
        res += diff['-'].map{|d| "- #{d}"}
        res << ""
        res << "You must not specify follow keys in config file (#{path}):"
        res += diff['+'].map{|d| "+ #{d}"}
        raise LoadError, "\n" + res.join("\n")
      end
    end
    return config
  end

  private
  def self.example_config(path)
    %w(.sample .example).each do |s|
      sample = path + s
      if File.exists?(sample)
        return YAML.load(ERB.new(File.read(sample)).result)
      end
    end
    return nil
  end

  def self.diff_keys(orig, other)
    res = {'-' => [], '+' => []}
    res['+'] = (orig.keys - other.keys).map(&:to_s)
    res['-'] = (other.keys - orig.keys).map(&:to_s)
    (orig.keys & other.keys).each do |k|
      if orig[k].is_a?(Hash) && other[k].is_a?(Hash)
        d = diff_keys(orig[k], other[k])
        res['+'] << ([k, d['+']].join(" -> ")) if not d['+'].empty?
        res['-'] << ([k, d['-']].join(" -> ")) if not d['-'].empty?
      end
    end
    return res
  end
end
