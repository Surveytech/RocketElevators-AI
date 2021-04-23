require 'net/http'
require 'httparty'
require 'openssl'
require 'net/http/post/multipart'

class SpeechController < ApplicationController

    def speech
        @fileList = Dir.entries("./app/assets/sounds").reject{|filename| filename =~/^.{1,2}$/}
        puts @fileList.length

        # f = File.read('./app/assets/sounds/Test1.wav')
        # # puts f.unpack('C*')
        # File.write("./app/assets/sounds/test.txt", f)



        # file_size = File.size("./app/assets/sounds/Claude.wav")
        # File.open("./app/assets/sounds/Claude.wav", "rb") do |file| 
        #     file.seek(postion)
        #     file.read(file_size - position)
        # end
        # request['Content-Type'] = 'application/octet-stream'
        #         # Request headers
        #         request['Ocp-Apim-Subscription-Key'] = "51d28a570828496f9d7e1ead5867b92f"

        # uri = URI('https://westus.stt.speech.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=234fbd49-f417-4786-973e-50d9964e99e2')

        # http = Net::HTTP.new(uri.host, uri.port)
        # http.use_ssl = true

        # request = Net::HTTP::Post.new(
        # uri,
        # # 'authorization'     => 'YOUR-API-TOKEN',
        # 'transfer-encoding' => 'chunked'
        # )

        # request['Content-Type'] = 'audio/wav'
        # request['Ocp-Apim-Subscription-Key'] = "51d28a570828496f9d7e1ead5867b92f"

        # request.body = {'audioData' => "#{File.binread('./app/assets/sounds/Claude.wav', 'rb')}" }
        

        # response = http.start do |http|
        # http.request(request)
        # end
        # puts response.read_body


    #    a = File.open('./app/assets/sounds/Claude.wav')
#         uri = URI('https://westus.stt.speech.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=234fbd49-f417-4786-973e-50d9964e99e2')

#         http = Net::HTTP.new(uri.host, uri.port)
#         http.use_ssl = true

#         request = Net::HTTP::Post.new(uri)

#         request['Content-Type'] = 'audio/wav; codecs=audio/pcm'

        # request.body = { 'audioData' => "#{File.read('./app/assets/sounds/Claude.wav')}"}

#         response = http.request(request)
#         puts response.read_body

        
        # uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identify?identificationProfileIds={identificationProfileIds}')
#         uri.query = URI.encode_www_form({
#             # Request parameters
#             'shortAudio' => '{boolean}'
#         })
# # Request headers
#         request['Content-Type'] = 'application/octet-stream'
#         # Request headers
#         request['Ocp-Apim-Subscription-Key'] = "51d28a570828496f9d7e1ead5867b92f"
#         # Request body
#         request.body = "{body}"

#         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#             http.request(request)
#         end

#         puts response.body




    # url = URI.parse('https://westus.stt.speech.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=234fbd49-f417-4786-973e-50d9964e99e2')
    # File.read("./app/assets/sounds/Claude.wav") do |wav|
    # req = Net::HTTP::Post::MultiparFile.open('/path/to/foo.wav', 'rb')
# t.new url.path,
    #     "file" => UploadIO.new(wav, "audio/wav", "audio.wav")
    # req['Content-Type'] = 'audio/wav; codecs=audio/pcm'
    # req['Ocp-Apim-Subscription-Key'] = "51d28a570828496f9d7e1ead5867b92f"

    # res = Net::HTTP.start(url.host, url.port) do |http|
    #     http.request(req)
    # end
    # puts res.code, res.message, res.header.inspect
    # end





# uri = URI("https://westus.stt.speech.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=234fbd49-f417-4786-973e-50d9964e99e2")

#         request = Net::HTTP::Post.new(uri)
#         # Request headers
#         request['Content-Type'] = 'application/octet-stream'
#         # Request headers
#         request['Ocp-Apim-Subscription-Key'] = "51d28a570828496f9d7e1ead5867b92f"
#         # Request body
#         request.body = "#{File.new('./app/assets/sounds/Claude.wav')}"

#         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#             http.request(request)
#         end

        

        # puts File.binread('./app/assets/sounds/Claude.wav')
        # puts IO.binread('./app/assets/sounds/Claude.wav')

        # f = File.binread('./app/assets/sounds/Test1.wav')
        # puts f.unpack('C*')
        # File.write("./app/assets/sounds/test.txt", f.unpack('B*'))

        # file = File.open("./app/assets/sounds/Claude.wav", 'rb')
        # profileID = "234fbd49-f417-4786-973e-50d9964e99e2"

        # headers = {
        #     'Ocp-Apim-Subscription-Key': "51d28a570828496f9d7e1ead5867b92f"
        # }
        # response = HTTParty.post("https://westus.stt.speech.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=234fbd49-f417-4786-973e-50d9964e99e2", :body => file, :headers => { 'Content-Type' => 'audio/wav; codecs=audio/pcm', 'Ocp-Apim-Subscription-Key' => '51d28a570828496f9d7e1ead5867b92f' })

        # puts response.body, response.code, response.message, response.headers.inspect
        # "234fbd49-f417-4786-973e-50d9964e99e2"
    end

    # V2 of the API who englobe speakerIdentification and get operation status
    def identifySpeaker(profileIds,filename)

        # File file = new File(`./app/assets/sounds/#{audioFile}`);
        # byte[] data = new byte[file.length()];
        # FileInputStream in = new FileInputStream(file);
        # in.read(data);
        # in.close();
        # puts data;

        uri = URI("https://westus.stt.speech.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=#{profileIds}")

        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'audio/wav; codecs=audio/pcm; samplerate=16000'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
        # Request body -> wave file
        request.body = "#{filename}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        puts response.body
    end
    
    def initialize
        @language = 'en-US'
    end

    # method to transcribe from an wave file to a text
    def speechToText()

        
        uri = URI('https://westus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US')
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Get.new(uri.request_uri)
        # request['language'] = 'en-US'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']

        request['Content-Type'] = 'audio/vnd.wave'
        # Request body
        request.body = './app/assets/sounds/Claude.wav'

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        puts response.body
    end







    def identCreateProfile

        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles')
        uri.query = URI.encode_www_form({
        })
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
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
        request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
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
        request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        puts response.body
    end
    
    # method to identify who is speaking
    def speakerIdentification(file)

        # File file = new File(`./app/assets/sounds/#{audioFile}`);
        # byte[] data = new byte[file.length()];
        # FileInputStream in = new FileInputStream(file);
        # in.read(data);
        # in.close();
        # puts data;


        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identify?identificationProfileIds={identificationProfileIds}')
        uri.query = URI.encode_www_form({
            # Request parameters
            'shortAudio' => '{boolean}'
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/octet-stream'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
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
        request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
        end

        puts response.body
    end

    


end