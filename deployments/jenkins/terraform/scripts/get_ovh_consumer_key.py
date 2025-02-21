import ovh

# Create a client using OVH API credentials
client = ovh.Client(
    endpoint='ovh-eu',                # OVH API endpoint (change as needed)
    application_key='***********', # add yours
    application_secret='*************'# add yours
)

# Request a consumer key with desired access rights
ck = client.new_consumer_key_request()
ck.add_recursive_rules(ovh.API_READ_WRITE, '/domain/zone/*')

# Ask OVH API to validate this consumer key
validation = ck.request()

print("Please visit %s to authenticate" % validation['validationUrl'])
print("Consumer Key is: %s" % validation['consumerKey'])
