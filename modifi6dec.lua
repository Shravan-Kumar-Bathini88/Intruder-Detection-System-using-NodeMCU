wifi.setmode(wifi.SOFTAP)
wifi.ap.config({ssid="test",pwd="12345678"})
gpio.mode(4, gpio.OUTPUT)
gpio.mode(1, gpio.INPUT)
gpio.mode(2, gpio.OUTPUT)



srv=net.createServer(net.TCP)
                        print("MAC:"..wifi.ap.getmac().."\r\nIP:"..wifi.ap.getip());
                        srv:listen(80,function(conn)
                            conn:on("receive", function(client,request)
                            local buf = ""
                             local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP")
                                if(method == nil)then
                                _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP")
                                 end
                            local _GET = {}
                            if (vars ~= nil)then
                            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                            _GET[k] = v
                            end
                            end
                            buf = buf.. "<h1><div style =\"text-align: center;\"> <font size=\"+15\" </font>CPE 555 Project - Intruder Detection System <meta http-equiv =\"refresh\" content=\"1\"> </div></h1>"
                            tmr.delay(1000)
                print(gpio.read(1))

                        

                if gpio.read(1) == 0 then
                gpio.write(4, gpio.HIGH)
                gpio.write(2, gpio.LOW)
                buf = buf.."<body> <div style =\"text-align: center;\"><font size=\"+10\" </font> Status: <b><font color =\"green\">Normal</b>. </div> </body>"
                --buf = buf.."<body> <button type=\"height:1000px;width:1000px\"> Normal </button></body>"

            
                tmr.delay(1000)
                 --               tmr.delay(5000)
                elseif gpio.read(1)==1 then
                gpio.write(4, gpio.LOW)
                gpio.write(2, gpio.HIGH)
                 buf = buf.."<body> <div style =\"text-align: center;\"><font size=\"+10\" </font> <b><font color =\"red\">Alert!!</b> Motion Detected!! </div> </body>"
                 tmr.delay(1000)
                end
      
                           client:send(buf)
                        end)
                        conn:on("sent", function (c) c:close() end)
      
            
end)
