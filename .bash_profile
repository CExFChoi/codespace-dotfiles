
# Application Setup

export APP_CONFIG_PATH=/workspaces/config_sample_v5
export INDEX_FILE_ATTACHMENTS=true
export DISABLE_SECURE_COOKIES=true
export DISABLE_ES_SNAPSHOT=true
export ES_USER=elastic
export ES_PASS=changeme
export YF_ENABLED=false
export DISABLE_DB_BACKUP=true
export DISABLE_CONFIG_BACKUP=true
export DEV_SERVER=true
export NODE_ENV=development
export SOURCE_MAP=1


# Yellowfin

#export YF_ENABLED=true
export YF_URL=https://report03.i-sightlab.com
export YF_URL_SVC=http://10.25.28.4:8888
export YF_USER=admin@yellowfin.com.au
export YF_PASSWORD=test
export YF_ORG_ID=1
export YF_ORG=fchoi
export YF_DATASOURCE_HOST=10.25.29.9


# Direct
#export MAIL_TRANSPORT=direct
#export MAILSRV_DOMAIN=localhost.local

# SMTP
#export MAIL_TRANSPORT=smtp
#export MAILSRV_DOMAIN=cec000425.i-sightlab.com
#export MAIL_FROM=info@cec000425.i-sightlab.com
#export MAIL_HOST=mail01.i-sightstg.com

# MailDev (http://127.0.0.1:1080)
export MAIL_TRANSPORT=false
export MAILSRV_PORT=1025
export MAIL_PORT=1025

# Other
export MAIL_IGNORE_TLS=true
export MAIL_DISABLE_DNS_VALID=true
export MAIL_DISABLE_STARTTLS=true
export PROXY=false
export ALLOWED_REFERERS=true
export SLEEP_TIME=2
export FORCE_ESCALATION_DELAY=1000
export LOG_LEVEL=info
export SOURCE_MAP=false
export REDIS_TIMEOUT=0
export TEST_RABBIT_MQ_VHOST=%2F
#export PURGE_DELAY_UNIT=m
#export PURGE_DELAY=1
#export PURGE_CRON_EXPRESSION="0 0/1 * * * ? *"
#export FIELDS_MEMORY_CACHE_TTL_MS=1000
#export CLIENT_PULSE_INTERVAL=1800000 # 30 minutes
export SSE_DISABLED=false
#export ES_REFRESH_INTERVAL=1s
export BULK_IMPORT_ES_REFRESH=true

export ENABLE_PDFTRON=false
export PDFTRON_LICENSE_KEY=demo:1632222196165:78c697490300000000f5d3a237b5cd40a89c7d0666c041d730d9906ad6

# Mapping
export ENABLE_GEO_MAPPING=true
export GEO_MAPPING_PROXY_MODE=true
export GEO_MAPPING_FRONTEND_KEY=pk.eyJ1IjoiaXNpZ2h0YWRtaW4iLCJhIjoiY2wxcDQzdDZpMTlxdTNsbW1nMDB3OXR5diJ9.y_Wx_GdZqWAwLa5SnHYDnQ
export GEO_MAPPING_SECRET_KEY=pk.eyJ1IjoiaXNpZ2h0YWRtaW4iLCJhIjoiY2wxcDQzdDZpMTlxdTNsbW1nMDB3OXR5diJ9.y_Wx_GdZqWAwLa5SnHYDnQ
export GEO_MAPPING_ACCESS_TOKEN_HASH=localdev