class MarksController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @mark = @report.marks.create(mark_params)
    redirect_to report_path(@report)
  end

  def destroy
    @report = Report.find(params[:report_id])
    @mark = @report.marks.find(params[:id])
    @mark.destroy
    redirect_to report_path(@report)
  end

  private def mark_params
    params.require(:mark).permit(:points)
  end
end
