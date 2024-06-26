package web.mybatis.vo;

public class NtCategoryVO {
	private int nt_ct_code;//카테고리 코드
	private String nt_ct_name; //카테고리 항목
	
	public NtCategoryVO() {}

	public NtCategoryVO(int nt_ct_code, String nt_ct_name) {
		super();
		this.nt_ct_code = nt_ct_code;
		this.nt_ct_name = nt_ct_name;
	}

	int getNt_ct_code() {
		return nt_ct_code;
	}

	void setNt_ct_code(int nt_ct_code) {
		this.nt_ct_code = nt_ct_code;
	}

	String getNt_ct_name() {
		return nt_ct_name;
	}

	void setNt_ct_name(String nt_ct_name) {
		this.nt_ct_name = nt_ct_name;
	}
	
	
}
