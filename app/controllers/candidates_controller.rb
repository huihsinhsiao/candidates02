class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_finish)

    if @candidate.save
      redirect_to candidates_path, notice: "新增候選人成功!"
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(candidate_finish)
      redirect_to candidates_path, notice: "編輯候選人成功!"
    else
      render :edit
    end
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy if @candidate
    redirect_to candidates_path, notice: "刪除候選人成功!"
  end

  private

  def candidate_finish
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

end
