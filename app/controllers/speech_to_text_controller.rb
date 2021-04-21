require 'net/http'

class SpeechToTextController < ApplicationController

    def identCreateProfile

        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles')
        uri.query = URI.encode_www_form({
        })
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '{ENV['AZURE_SPEECH_KEY']}'
        # Request body
        request.body = "{body}"
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        puts response.body
    end

    def identCreateEnrollment

        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/{identificationProfileId}/enroll')
        uri.query = URI.encode_www_form({
            # Request parameters
            'shortAudio' => '{boolean}'
        })
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'multipart/form-data'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '{ENV['AZURE_SPEECH_KEY']}'
        # Request body
        request.body = "{body}"
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        puts response.body
    end

    def identDeleteProfile

        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/{identificationProfileId}')
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Delete.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '{ENV['AZURE_SPEECH_KEY']}'
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        puts response.body
    end
    
    # method to identify who is speaking
    def speakerIdentification

        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identify?identificationProfileIds={identificationProfileIds}')
        uri.query = URI.encode_www_form({
            # Request parameters
            'shortAudio' => '{boolean}'
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/octet-stream'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '{ENV['AZURE_SPEECH_KEY']}'
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        puts response.body
    end
    # method to retrieve the identified profile Id
    def getOperationStatus

        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/operations/{operationId}')
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '{ENV['AZURE_SPEECH_KEY']}'
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
        end

        puts response.body
    end
    # method to transcribe from an wave file to a text
    def speechToText

        uri = URI('https://westus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US')
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '{ENV['AZURE_SPEECH_KEY']}'
        request['Content-Type'] = 'application/octet-stream'
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        puts response.body
    end

end