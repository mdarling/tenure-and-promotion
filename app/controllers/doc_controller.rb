class DocController < ApplicationController
  skip_before_filter :cas_filter
  def index
  end
end
