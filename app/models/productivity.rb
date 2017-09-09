class Productivity < ApplicationRecord
	belongs_to :discipline
	belongs_to :student

	validates :total_questions, :correct_questions, :time_studed, :date, presence: true

	def self.find_productivity(rengeTime, customRangeBeginning, customRangeEnd, student, discipline)
		if rengeTime == "today"
			date = Date.today
			@interval = date..date.end_of_day
		elsif rengeTime == "week"
			dateb = Date.today.at_beginning_of_week
			datee = Date.today.at_end_of_week
			@interval = dateb..datee.end_of_day
		elsif rengeTime == "month"
			dateb = Date.today.at_beginning_of_month
			datee = Date.today.at_end_of_month
			@interval = dateb..datee.end_of_day
		else
			dateb = Date.parse(customRangeBeginning)
			datee = Date.parse(customRangeEnd)
			@interval = dateb..datee.end_of_day
		end

		if discipline == "all"
			@productivity = student.productivities.where(date: @interval)
		else
			@productivity = student.productivities.where(date: @interval, discipline_id: discipline)
		end

		return @productivity.order(:discipline_id)
	end

	def self.organize_data(produtivity, discipline)
		total = 0
		correct = 0
		time = 0
		produtivity.each do |pro|
			total = total + pro.total_questions
			correct = correct + pro.correct_questions
			time = time + pro.time_studed
		end

		incorrect = total - correct
		pie_chart_total_data = []
		pie_chart_total_data << {name: "Acertos", data: correct}
		pie_chart_total_data << {name: "Erros", data: incorrect}

		if total == 0
			return -1
		end

		if discipline == 'all'
			disciplines = []
			produtivity.each do |pro|
				disciplines << pro.discipline.id
			end
			disciplines = disciplines.uniq

			bar_chart = []
			pie_chart_total_time = []
			disciplines.each do |d_id|
				total_disciplie = 0.0
				correct_disciplie = 0.0
				time_disciplie = 0
				produtivity.where(discipline_id: d_id).each do |pro|
					total_disciplie = total_disciplie + pro.total_questions
					correct_disciplie = correct_disciplie + pro.correct_questions
					time_disciplie = time_disciplie + pro.time_studed
				end
				full_name = Discipline.find(d_id).name
				name = Discipline.find(d_id).nick_name
				percent = correct_disciplie / total_disciplie * 100
				percent = percent.round(2)
				bar_chart << [{name: name, data: percent, full_name: full_name}]
				pie_chart_total_time << {name: name, data: time_disciplie, full_name: full_name}
			end

			@data = {totalQuestions: total, totalTime: time, pieChartTotalData: pie_chart_total_data, pieChartTotalTime: pie_chart_total_time, BarChart: bar_chart}
		else
			@data = {totalQuestions: total, totalTime: time, pieChartTotalData: pie_chart_total_data}
		end

		return @data
	end

end
