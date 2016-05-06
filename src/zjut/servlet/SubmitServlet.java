package zjut.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SubmitServlet
 */
@WebServlet("/SubmitServlet")
public class SubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubmitServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String algo = request.getParameter("algo");
		PrintWriter out = response.getWriter();
		if (algo.equals("fm")) {
			try {
				String path = "/home/ian/Documents/AvazuSpark/test.sh";
				Process ps = Runtime.getRuntime().exec(path);
				ps.waitFor();
				out.println("Training Complete.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (algo.equals("lr")) {
			try {
				String path = "/home/ian/Documents/AvazuSpark/submitLR.sh";
				Process ps = Runtime.getRuntime().exec(path);
				ps.waitFor();
				out.println("Training Complete.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (algo.equals("gbdt")) {

		} else if (algo.equals("rf")) {

		}
		out.flush();
		out.close();
	}

}
