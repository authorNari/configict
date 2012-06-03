class TestConfliction < Test::Unit::TestCase
  def test_load_yml
    Confliction.load_yml(File.join(
      File.dirname(__FILE__),
      "fixtures/config_loader.yml"))

    assert_raise(RuntimeError) do
      Confliction.load_yml(File.join(
        File.dirname(__FILE__),
        "fixtures/config_loader_has_diff.yml"))
    end
  end
end
