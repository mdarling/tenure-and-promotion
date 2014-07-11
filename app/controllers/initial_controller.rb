class InitialController < ApplicationController
  layout "wizard"
  def index
   @backpage="candidate_view"
   @forwardpage="curriculum_vitae"
   @pagename="Test File"
   @pagetype=1
  end
  def cv
   @backpage="initial"
   @pagename="Curriculum Vitae"
   @forwardpage="teaching_statement"
   @pagetype=1
  end
  def ts
   @backpage="curriculum_vitae"
   @forwardpage="researchstatement"
   @pagename="Teaching Statement"
   @pagetype=1
  end
  def rs
   @backpage="teaching_statement"
   @forwardpage="servicestatement"
   @pagename="Research Statement"
   @pagetype=1
  end
  def ss
   @backpage="researchstatement"
   @forwardpage="additional_materials"
   @pagename="Service Statement"
   @pagetype=1
  end
  def am
   @backpage="servicestatement"
   @forwardpage="compiling"
   @pagename="Additional Materials"
   @pagetype=1
  end
  def compile
   @backpage="additional_materials"
   @forwardpage="publish"
   @pagename="Compiling"
   @pagetype=2
  end
  def publish
   @backpage="compiling"
   @forwardpage="candidate_view"
   @pagename="Publish"
   @pagetype=2
  end
end