. env.sh

green "Running Consul Template to produce static files being read by the web server"

cat << EOF
consul-template -vault-renew-token=false -consul-addr=http://127.0.0.1:8500 
  -template="./consul-template/holy_grail.json.tpl:static/holy_grail.json"
  -template="./consul-template/holy_grail.html.tpl:static/holy_grail.html" & 
EOF

consul-template -vault-renew-token=false -consul-addr=http://127.0.0.1:8500 \
  -template="./consul-template/holy_grail.json.tpl:static/holy_grail.json" \
  -template="./consul-template/holy_grail.html.tpl:static/holy_grail.html" & 
CT_PID=$!
p

green "Load round 1 of data. After doing so, reload the web page"
cat << EOF
consul kv put demo/consul-template/questions '{"question1" : "What is your name",
"answer1" : "Sir Lancelot of Camelot",
"question2" : "What is your quest?",
"answer2": "To seek the Holy Grail.",
"question3": "What is your favourite color",
"answer3":  "Blue",
"bridgekeeper": "STOP! Who would cross the Bridge of Death must answer me these questions three, ere the other side he see."}'
EOF

consul kv put demo/consul-template/questions '{"question1" : "What is your name",
"answer1" : "Sir Lancelot of Camelot",
"question2" : "What is your quest?",
"answer2": "To seek the Holy Grail.",
"question3": "What is your favourite color",
"answer3":  "Blue",
"bridgekeeper": "STOP! Who would cross the Bridge of Death must answer me these questions three, ere the other side he see."}'

cyan "Reload http://localhost:8000/consul-template/"
p

green "Load round 2 of data. After doing so, reload the web page"
cat << EOF
consul kv put demo/consul-template/questions '{"question1" : "What is your name",
"answer1" : "Sir Robin of Camelot",
"question2" : "What is your quest?",
"answer2": "To seek the Holy Grail.",
"question3": "What...is the capital of Assyria",
"answer3":  "I dont know that! AAAAAAAAAH!",
"bridgekeeper": "STOP! Whoever approacheth the Bridge of Death must answer me these questions three, ere the other side he see."}'
EOF

consul kv put demo/consul-template/questions '{"question1" : "What is your name",
"answer1" : "Sir Robin of Camelot",
"question2" : "What is your quest?",
"answer2": "To seek the Holy Grail.",
"question3": "What...is the capital of Assyria",
"answer3":  "I dont know that! AAAAAAAAAH!",
"bridgekeeper": "STOP! Whoever approacheth the Bridge of Death must answer me these questions three, ere the other side he see."}'
cyan "Reload http://localhost:8000/consul-template/"
p

green "Load round 3 of data. After doing so, reload the web page"
cat << EOF
consul kv put demo/consul-template/questions '{"question1" : "What is your name",
"answer1" : "Sir Galahad of Camelot",
"question2" : "What is your quest?",
"answer2": "I seek the Holy Grail.",
"question3": "What is your favourite color",
"answer3":  "Blue.  No Yelloooooooooooaaaaaaaaahhhhhh!",
"bridgekeeper": "STOP!"}'
EOF

consul kv put demo/consul-template/questions '{"question1" : "What is your name",
"answer1" : "Sir Galahad of Camelot",
"question2" : "What is your quest?",
"answer2": "I seek the Holy Grail.",
"question3": "What is your favourite color",
"answer3":  "Blue.  No Yelloooooooooooaaaaaaaaahhhhhh!",
"bridgekeeper": "STOP!"}'
cyan "Reload http://localhost:8000/consul-template/"
p

green "Load round 4 of data. After doing so, reload the web page"
cat << EOF
consul kv put demo/consul-template/questions '{"question1" : "What is your name",
"answer1" : "It is Arthur, King of the Britons",
"question2" : "What is your quest?",
"answer2": "To seek the Holy Grail.",
"question3": "What is the airspeed velocity of an unladen swallow?",
"answer3":  "What do you mean?  An African or European swallow",
"bridgekeeper": "Hee hee hee. STOP!"}'
EOF

consul kv put demo/consul-template/questions '{"question1" : "What is your name",
"answer1" : "It is Arthur, King of the Britons",
"question2" : "What is your quest?",
"answer2": "To seek the Holy Grail.",
"question3": "What is the airspeed velocity of an unladen swallow?",
"answer3":  "What do you mean?  An African or European swallow",
"bridgekeeper": "Hee hee hee. STOP!"}'
cyan "Reload http://localhost:8000/consul-template/"
p

yellow "Killing Consul Template"
kill -9 $CT_PID
