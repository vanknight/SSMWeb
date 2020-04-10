package com.web.bean.temp;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/5/19 13:47
 * @description:
 */
public class Logistics {

    @JsonProperty("ShipperCode")
    private String shipperCode;
    @JsonProperty("LogisticCode")
    private String logisticCode;
    @JsonProperty("Success")
    private Boolean success;
    @JsonProperty("State")
    private String state;
    @JsonProperty("Traces")
    private List<Traces> traces;

    @Override
    public String toString() {
        return "Logistics{" +
            "shipperCode='" + shipperCode + '\'' +
            ", logisticCode='" + logisticCode + '\'' +
            ", success=" + success +
            ", state='" + state + '\'' +
            ", traces=" + traces +
            '}';
    }

    public Logistics(String shipperCode, String logisticCode, Boolean success, String state,
        List<Traces> traces) {
        this.shipperCode = shipperCode;
        this.logisticCode = logisticCode;
        this.success = success;
        this.state = state;
        this.traces = traces;
    }

    public Logistics() {
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getShipperCode() {
        return shipperCode;
    }

    public void setShipperCode(String shipperCode) {
        this.shipperCode = shipperCode;
    }

    public String getLogisticCode() {
        return logisticCode;
    }

    public void setLogisticCode(String logisticCode) {
        this.logisticCode = logisticCode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public List<Traces> getTraces() {
        return traces;
    }

    public void setTraces(List<Traces> traces) {
        this.traces = traces;
    }
}
