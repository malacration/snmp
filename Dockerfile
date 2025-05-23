# Base Red Hat UBI 9 minimal - compatível com a policy “restricted” do OpenShift
FROM registry.access.redhat.com/ubi9-minimal:latest

# Instala o cliente SNMP e utilitários básicos
RUN microdnf install -y \
        net-snmp-utils \
        net-snmp \
        iputils \
        bash \
    && microdnf clean all

# Cria um usuário não-root exigido pelos SCCs padrão
RUN useradd -u 1001 snmp
USER 1001

# Mantém o contêiner vivo (você substitui por bash via oc rsh/exec)
ENTRYPOINT ["/bin/bash", "-c", "sleep infinity"]
