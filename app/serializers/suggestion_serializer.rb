class SuggestionSerializer < Panko::Serializer
 attributes :id,
            :title,
            :description

    has_many :activities, each_serializer: ActivitySerializer
end 