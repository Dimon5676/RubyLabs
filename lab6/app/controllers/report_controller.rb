
class ReportController < ApplicationController
  def index
    @report = Report.all
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    if(@report.update(report_params))
      redirect_to @report
    else
      render 'edit'
    end
  end

  def destroy
    @report = Report.find(params[:id])

    @report.destroy
    redirect_to :action => :index
  end

  def show
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)

    if(@report.save)
      redirect_to @report
    else
      render 'new'
    end
  end

  private def report_params
    params.require(:report).permit(:title, :description)
  end
end
