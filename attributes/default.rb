
# Let's have Jenkins run on port 8081
override['jenkins']['master']['port'] = 8081

node.set['jenkins']['master']['jenkins_args'] = '--prefix=/jenkins'
