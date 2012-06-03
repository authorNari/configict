class TestConfigict < Test::Unit::TestCase
  def test_load_yml
    Configict.load_yml(File.join(
      File.dirname(__FILE__),
      "fixtures/config_loader.yml"))

    assert_raise(Configict::LoadError) do
      Configict.load_yml(File.join(
        File.dirname(__FILE__),
        "fixtures/config_loader_has_diff.yml"))
    end
  end
end
