package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;
public class MemberDAO {

    private DBOpen dbopen = null;
    private Connection con = null; // 데이터베이스 연동
    private PreparedStatement pstmt = null; // sql문 입력
    private ResultSet rs = null; // 커서
    private StringBuilder sql = null;

    public MemberDAO(){
        dbopen = new DBOpen();

    }

    public String loginProc(MemberDTO dto){
        String mlevel=null;
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();

            sql.append(" SELECT mlevel ");
            sql.append(" FROM member ");
            sql.append(" WHERE id=? AND passwd=? ");
            sql.append(" AND mlevel in ('A1', 'B1', 'C1', 'D1') ");
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPasswd());

            rs = pstmt.executeQuery();
            if(rs.next()){
                mlevel = rs.getString("mlevel");
            }
        }
        catch (Exception e) {
            System.out.println("로그인 실패"+e);
        }finally{
             DBClose.Close(con, pstmt, rs);
        }
        return mlevel;

    }//end loginproc

    public int duplicate(String id){
        int cnt=0;
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();
            sql.append(" SELECT COUNT(id) as cnt");
            sql.append(" FROM member ");
            sql.append(" WHERE id=? ");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cnt = rs.getInt("cnt");
            }
        }catch (Exception e) {
            System.out.println("아이디 중복 확인 실패"+e);
        }finally {
            DBClose.Close(con, pstmt, rs);
        }
        return cnt;
    }//end duplicate

    public int duplicate2(String email){
        int cnt=0;
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();
            sql.append(" SELECT COUNT(email) as cnt");
            sql.append(" FROM member ");
            sql.append(" WHERE email=? ");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cnt = rs.getInt("cnt");
            }
        }catch (Exception e) {
            System.out.println("이메일 중복 확인 실패"+e);
        }finally {
            DBClose.Close(con, pstmt, rs);
        }
        return cnt;
    }//end duplicate 2
}//end class


