FROM redis:alpine
LABEL maintainer="Charlie Lewis <clewis@iqt.org>" \
      vent="" \
      vent.name="redis" \
      vent.groups="core" \
      vent.section="cyberreboot:vent:/vent/core/redis:master:HEAD" \
      vent.repo="https://github.com/cyberreboot/vent" \
      vent.type="repository"

HEALTHCHECK --interval=15s --timeout=15s \
 CMD redis-cli ping
CMD redis-server --appendonly yes
