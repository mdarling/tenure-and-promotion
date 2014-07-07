class InitialController < ApplicationController
  layout "wizard"
  def index
  @pagename="Test File"
  @pagetype=1 
  end
  def cv
  @pagename="Curriculum Vitae"
  @pagetype=1
  end
  def ts
  @pagename="Teaching Statement"
  @pagetype=1
  end
  def rs
  @pagename="Research Statement"
  @pagetype=1
  end
  def ss
  @pagename="Service Statement"
  @pagetype=1
  end
  def am
  @pagename="Additional Materials"
  @pagetype=1
  end
  def publish
  @pagename="Publish"
  @pagetype=2
  end
  def compile
  @pagename="Compiling"
  @pagetype=2
  end
end
