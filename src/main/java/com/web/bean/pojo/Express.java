package com.web.bean.pojo;

/**
 * @author Administrator
 */
public class Express {

    private String eid;
    private String oid;
    private String logisticCode;
    private String shipperCode;
    private String remarks;

    @Override
    public String toString() {
        return "Express{" +
            "eid='" + eid + '\'' +
            ", oid='" + oid + '\'' +
            ", logisticCode='" + logisticCode + '\'' +
            ", shipperCode='" + shipperCode + '\'' +
            ", remarks='" + remarks + '\'' +
            '}';
    }

    public Express(String eid, String oid, String logisticCode, String shipperCode,
        String remarks) {
        this.eid = eid;
        this.oid = oid;
        this.logisticCode = logisticCode;
        this.shipperCode = shipperCode;
        this.remarks = remarks;
    }

    public Express() {
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getOid() {
        return oid;
    }

    public String getLogisticCode() {
        return logisticCode;
    }

    public void setLogisticCode(String logisticCode) {
        this.logisticCode = logisticCode;
    }

    public String getShipperCode() {
        return shipperCode;
    }

    public void setShipperCode(String shipperCode) {
        this.shipperCode = shipperCode;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }


    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
