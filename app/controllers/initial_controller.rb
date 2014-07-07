class InitialController < ApplicationController
  layout "wizard"
  def index
  @pagename="Test File"
  end
  def cv
  @pagename="Curriculum Vitae"
  end
  def ts
  @pagename="Teaching Statement"
  end
  def rs
  @pagename="Research Statement"
  end
  def ss
  @pagename="Service Statement"
  end
  def am
  @pagename="Additional Materials"
  end
  def publish
  @pagename="Publish"
  end
  def compile
  @pagename="Compiling"
  end
end
