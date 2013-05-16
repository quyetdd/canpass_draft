class ImportsController < ApplicationController
  def new
    @import = Import.new
  end

  def create
    @import = Import.new(params[:import])
    if @import.save
      Resque.enqueue(ImportCsv, @import.csv.url)
      redirect_to @import
    else
      render :new
    end
  end

  def show
    @import = Import.find(params[:id])
  end
end
