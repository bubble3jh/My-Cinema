1. conf : DB 연결정보, API 키값 등 환경변수 정보 저장

2. public :  정적 파일을 위한 폴더로서 자바스크립트 파일, 이미지 파일, CSS 등을 포함합니다. 웹URL의 루트폴더로 생각하시면 됩니다. 관리를 쉽게하기 위해 js와 css로 폴더를 구분했습니다. 

3. routes :  라우팅을 위한 폴더입니다. 라우팅 리소스 별로 모듈을 만들어 라우팅 로직을 구현합니다. 클라이언트에서 요청 별로 어떤 로직을 수행할지 정해놓은 파일이라고 생각하시면 됩니다. (java에서는 Controller 역할)

4. views : request 요청에 대한 로직을 처리한 후 클라이언트에 응답을 보낼 때 html 코드로 변환해서 반환하는 파일을 정의한 폴더입니다.  여기선 ejs 템플릿을 사용합니다. 

5. web.js : express  설정파일이 담겨있는 파일입니다.(보통 파일 자동생성시 app.js 로 되어 있는데 cafe24를 호스팅으로 사용할 경우 파일이름이 web.js로 되어 있어야 합니다.)

6. package.json :  프로그램 이름, 버전, 필요한 모듈 등 노드 프로그램의 정보를 기술합니다. (NPM은 이 정보를 참고하여 필요한 모듈을 관리)