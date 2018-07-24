class Gossip
	attr_accessor :gossip_author, :gossip_content

	def initialize(gossip_author, gossip_content)
		@gossip_author = gossip_author
		@gossip_content = gossip_content
	end

	def save
		file = CSV.open("./bd/gossips.csv", "ab") do |csv|
			csv << ["#{@gossip_author}", "#{@gossip_content}"]
			# méthode save crée le tableau CSV
		end		
	end

	def self.all
		all_gossips = []
		CSV.read("./bd/gossips.csv", "rb").each do |row|
			all_gossips << Gossip.new(row[0], row[1])
		end
		return all_gossips
	end

	def self.find(id)
		the_id = id.to_i - 1
		CSV.read("./bd/gossips.csv", "rb").fetch(the_id)
		# méthode fetch sur un tableau permet d'aller cherche la valeur correspondante à l'index donné
		return the_id + 1
	end

end