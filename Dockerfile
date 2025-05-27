# Base Ubuntu Server LTS minimal
FROM ubuntu:22.04

# Evita prompts interativos na instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instala o cliente SNMP e utilitários básicos
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        snmp            \
        snmpd           \
        iputils-ping    \
        bash &&         \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Mantém o contêiner vivo (substitua por bash via oc rsh/exec, se quiser)
ENTRYPOINT ["bash", "-c", "sleep infinity"]
