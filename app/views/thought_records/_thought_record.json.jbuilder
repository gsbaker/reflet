json.extract! thought_record, :id, :situation, :feelings, :thoughts, :evidence_for, :evidence_against, :alternative_thoughts, :alternative_feelings, :created_at, :updated_at
json.url thought_record_url(thought_record, format: :json)
json.situation thought_record.situation.to_s
json.feelings thought_record.feelings.to_s
json.thoughts thought_record.thoughts.to_s
json.evidence_for thought_record.evidence_for.to_s
json.evidence_against thought_record.evidence_against.to_s
