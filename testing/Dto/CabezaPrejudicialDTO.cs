namespace CobranzaALC.Dto
{
    using System;

    public class CabezaPrejudicialDTO
    {
        private string nom_cli;
        private string nom_deudor;
        private string nrooperacion;
        private string rut_deudor;

        ~CabezaPrejudicialDTO()
        {
        }

        public string Nom_Cli
        {
            get
            {
                return this.nom_cli;
            }
            set
            {
                this.nom_cli = value;
            }
        }

        public string Nom_Deudor
        {
            get
            {
                return this.nom_deudor;
            }
            set
            {
                this.nom_deudor = value;
            }
        }

        public string NroOperacion
        {
            get
            {
                return this.nrooperacion;
            }
            set
            {
                this.nrooperacion = value;
            }
        }

        public string Rut_Deudor
        {
            get
            {
                return this.rut_deudor;
            }
            set
            {
                this.rut_deudor = value;
            }
        }
    }
}

