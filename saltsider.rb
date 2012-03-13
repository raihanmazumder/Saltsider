class Saltsider
  # Fix me
end

describe Saltsider do
  before do
    @saltsider = Saltsider.new(:name => "Saltsider",
                               :email => "hello@saltside.se",
                               :phone => "+46704676919",
                               :knows_html => true,
                               :knows_css => true,
                               :knows_javascript => true,
                               :knows_ruby => true,
                               :knows_ruby_on_rails => true)

    @json = '{"saltsider":{"name":"Saltsider","email":"hello@saltside.se","phone":"+46704676919","skills":{"html":true,"css":true,"javascript":true,"ruby":true,"ruby_on_rails":true}}}'
  end

  context "measurement of awesomeness :D" do
    it "should rank 5 skill points as Saltsider" do
      saltsider = Saltsider.new(:knows_html => true, :knows_css => true, :knows_javascript => true,
                                :knows_ruby => true, :knows_ruby_on_rails => true)
      saltsider.level_of_awesomeness.should eq "Saltsider"
    end

    it "should rank 4 skill points as l33t" do
      saltsider = Saltsider.new(:knows_html => true, :knows_css => true,
                                :knows_ruby => true, :knows_ruby_on_rails=> true)
      saltsider.level_of_awesomeness.should eq "l33t"
    end

    it "should rank 3 skill points as Rock Star" do
      saltsider = Saltsider.new(:knows_html => true, :knows_css => true,
                                :knows_ruby_on_rails => true)
      saltsider.level_of_awesomeness.should eq "Rock Star"
    end

    it "should rank 2 skill points as Programmer" do
      saltsider = Saltsider.new(:knows_html => true, :knows_ruby_on_rails => true)
     saltsider.level_of_awesomeness.should eq "Programmer"
    end

    it "should rank 1 skill points as n00b" do
      saltsider = Saltsider.new(:knows_html => true)
      saltsider.level_of_awesomeness.should eq "n00b"
    end

    it "should rank 0 skill points as Script Kid" do
      saltsider.level_of_awesomeness.should eq "Script Kid"
    end
  end

  it "should return data in json format" do
    @saltsider.to_json.should eq @json
  end

  it "should validate presence of name" do
    saltsider = Saltsider.new(:email => "hello@saltside.se",
                              :phone => "+46704676919",
                              :knows_html => true,
                              :knows_css => true,
                              :knows_javascript => true,
                              :knows_ruby => true,
                              :knows_ruby_on_rails => true)
    saltsider.valid?.should eq false
  end

  it "should validate presence of email" do
    saltsider = Saltsider.new(:name => "Saltsider",
                              :phone => "+46704676919",
                              :knows_html => true,
                              :knows_css => true,
                              :knows_javascript => true,
                              :knows_ruby => true,
                              :knows_ruby_on_rails => true)
    saltsider.valid?.should eq false
  end

  it "should validate presence of phone number" do
    saltsider = Saltsider.new(:name => "Saltsider",
                              :email => "hello@saltside.se",
                              :knows_html => true,
                              :knows_css => true,
                              :knows_javascript => true,
                              :knows_ruby => true,
                              :knows_ruby_on_rails => true)
    saltsider.valid?.should eq false
  end

  it "should validate presence of skills" do
    saltsider = Saltsider.new(:name => "Saltsider",
                              :email => "hello@saltside.se",
                              :phone => "+46704676919",
                              :knows_html => true,
                              :knows_css => true,
                              :knows_javascript => true,
                              :knows_ruby_on_rails => true)
   saltsider.valid?.should eq false
  end

  it "should validate true when all application data is valid" do
    @saltsider.valid?.should eq true
  end
end
