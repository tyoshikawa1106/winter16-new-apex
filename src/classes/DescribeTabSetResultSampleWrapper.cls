public with sharing class DescribeTabSetResultSampleWrapper {
    
    public String label {get; set;}
    public String logoUrl {get; set;}
    public String namespace {get; set;}
    public Boolean isSelected {get; set;}
    public String description {get; set;}
    
    public DescribeTabSetResultSampleWrapper() {
        this.label = '';
        this.logoUrl = '';
        this.namespace = '';
        this.isSelected = false;
        this.description = '';
    }
    
    public DescribeTabSetResultSampleWrapper(Schema.DescribeTabSetResult tsr) {
        this.label = tsr.getLabel();
        this.logoUrl = tsr.getLogoUrl();
        this.namespace = tsr.getNamespace();
        this.isSelected = tsr.isSelected();
        this.description = tsr.getDescription();
    }
}