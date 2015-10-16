public with sharing class DescribeTabSetResultSampleController {
    
    public List<DescribeTabSetResultSampleWrapper> wrapperList {get; set;}
    
    public DescribeTabSetResultSampleController() {
        this.wrapperList = this.getDescribeTabSetResultSampleWrapper();
    }
    
    private List<DescribeTabSetResultSampleWrapper> getDescribeTabSetResultSampleWrapper() {
        List<DescribeTabSetResultSampleWrapper> wrapperList = new List<DescribeTabSetResultSampleWrapper>();
        List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
        for (Schema.DescribeTabSetResult tsr : tabSetDesc) {
            wrapperList.add(new DescribeTabSetResultSampleWrapper(tsr));
        }
        
        return wrapperList;
    }
}